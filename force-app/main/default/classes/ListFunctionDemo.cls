public class ListFunctionDemo {

    public static void demoListFunctions() {

        // Create a list of Integers
        List<Integer> numbers = new List<Integer>();

        // 1. add(value) - Adds an element to the end of the list
        numbers.add(10);
        numbers.add(20);
        numbers.add(30);

        // 2. add(index, value) - Inserts an element at the specified index
        numbers.add(1, 15); // Now the list is: [10, 15, 20, 30]

        // 3. get(index) - Retrieves the element at the specified index
        System.debug('Element at index 2: ' + numbers.get(2)); // Output: 20

        // 4. set(index, value) - Updates the element at the specified index
        numbers.set(2, 25); // Replaces 20 with 25. List: [10, 15, 25, 30]

        // 5. size() - Returns the number of elements in the list
        System.debug('Size of list: ' + numbers.size()); // Output: 4

        // 6. contains(value) - Checks if a value exists in the list
        System.debug('List contains 25: ' + numbers.contains(25)); // true
        System.debug('List contains 100: ' + numbers.contains(100)); // false

        // 7. indexOf(value) - Returns the index of the first occurrence
        System.debug('Index of 25: ' + numbers.indexOf(25)); // Output: 2

        // 8. isEmpty() - Returns true if the list is empty
        System.debug('Is the list empty?: ' + numbers.isEmpty()); // false

        // 9. addAll(List) - Adds all elements of another list to this one
        List<Integer> moreNumbers = new List<Integer>{40, 50};
        numbers.addAll(moreNumbers); // List: [10, 15, 25, 30, 40, 50]

        // 10. clone() - Creates a copy of the list
        List<Integer> clonedList = numbers.clone();
        System.debug('Cloned list: ' + clonedList); // Output: same as original

        // 11. sort() - Sorts the list in ascending order
        clonedList.sort(); // Sorted List: [10, 15, 25, 30, 40, 50]
        System.debug('Sorted cloned list: ' + clonedList);

        // 12. remove(index) - Removes the element at the given index
        numbers.remove(0); // Removes 10, List becomes: [15, 25, 30, 40, 50]
        System.debug('List after removing index 0: ' + numbers);

        // 13. clear() - Removes all elements from the list
        numbers.clear(); // List is now empty
        System.debug('List after clear(): ' + numbers); // Output: ()

        // 14. isEmpty() again - Now returns true
        System.debug('Is the list empty now?: ' + numbers.isEmpty()); // true
    }

}