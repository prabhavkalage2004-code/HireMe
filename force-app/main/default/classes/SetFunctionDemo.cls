public class SetFunctionDemo {

    public static void demoSetFunctions() {

        // 1. Create a Set of Integers
        Set<Integer> numSet = new Set<Integer>();

        // 2. add(value) - Adds a value to the set
        numSet.add(10);
        numSet.add(20);
        numSet.add(30);
        numSet.add(20); // Duplicate, will not be added

        System.debug('Initial Set: ' + numSet); // Output: {10, 20, 30}

        // 3. contains(value) - Checks if a value exists in the set
        System.debug('Set contains 20: ' + numSet.contains(20));
        System.debug('Set contains 100: ' + numSet.contains(100));

        // 4. size() - Returns the number of elements
        System.debug('Size of Set: ' + numSet.size()); // Output: 3

        // 5. isEmpty() - Checks if the set is empty
        System.debug('Is Set empty?: ' + numSet.isEmpty()); // Output: false

        // 6. remove(value) - Removes a value from the set
        numSet.remove(10);
        System.debug('After removing 10: ' + numSet); // Output: {20, 30}

        // 7. addAll(Set/Collection) - Adds all elements from another Set or List
        Set<Integer> newSet = new Set<Integer>{40, 50, 30}; // 30 is duplicate
        numSet.addAll(newSet);
        System.debug('After addAll: ' + numSet); // Output: {20, 30, 40, 50}

        // 8. clone() - Creates a copy of the Set
        Set<Integer> clonedSet = numSet.clone();
        System.debug('Cloned Set: ' + clonedSet);

        // 9. clear() - Removes all elements from the set
        numSet.clear();
        System.debug('After clear(): ' + numSet); // Output: {}

        // 10. isEmpty() again
   
       System.debug('Is Set empty now?: ' + numSet.isEmpty()); // Output: true
        
    }
}