import { LightningElement } from 'lwc';
import myImage from '@salesforce/resourceUrl/image';

export default class ImageDisplay extends LightningElement {
    imageUrl = myImage;
}