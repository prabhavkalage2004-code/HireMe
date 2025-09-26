import { LightningElement, wire, track } from 'lwc';
import getPositions from '@salesforce/apex/PositionController.getPositions';
import deletePositions from '@salesforce/apex/PositionController.deletePositions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import { NavigationMixin } from 'lightning/navigation';

const actions = [
    { label: 'Edit', name: 'edit' },
    { label: 'Delete', name: 'delete' }
];

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Status', fieldName: 'Status__c' },
    { label: 'Location', fieldName: 'Location__c' },
    { type: 'action', typeAttributes: { rowActions: actions } }
];

export default class PositionList extends NavigationMixin(LightningElement) {
    @track positions;
    columns = columns;
    wiredPositionsResult;

    @wire(getPositions)
    wiredPositions(result) {
        this.wiredPositionsResult = result;
        if (result.data) {
            this.positions = result.data;
        } else if (result.error) {
            this.showToast('Error', result.error.body.message, 'error');
        }
    }

    // Row action handler (Edit/Delete)
    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;

        if (actionName === 'edit') {
            this.editRecord(row.Id);
        } else if (actionName === 'delete') {
            this.deleteRecord(row.Id);
        }
    }

    // Edit record
    editRecord(recordId) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recordId,
                objectApiName: 'Position__c',
                actionName: 'edit'
            }
        });
    }

    // Delete record
    deleteRecord(recordId) {
        deletePositions({ positionIds: [recordId] })
            .then(() => {
                this.showToast('Success', 'Record deleted successfully', 'success');
                return refreshApex(this.wiredPositionsResult);
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    // Create new record
    handleNew() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Position__c',
                actionName: 'new'
            }
        });
    }

    // Toast helper
    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}