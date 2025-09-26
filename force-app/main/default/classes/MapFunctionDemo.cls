public class MapFunctionDemo {

    public static void demoMapFunctions() {

        // 1. Create a Map with Integer keys and String values
        Map<Integer, String> studentMap = new Map<Integer, String>();

        // 2. put(key, value) - Adds a key-value pair to the map
        studentMap.put(101, 'Alice');
        studentMap.put(102, 'Bob');
        studentMap.put(103, 'Charlie');

        // 3. get(key) - Retrieves the value for a given key
        System.debug('Name with ID 102: ' + studentMap.get(102)); // Bob

        // 4. containsKey(key) - Checks if the map contains a key
        System.debug('Contains key 103: ' + studentMap.containsKey(103)); // true

        // 5. containsValue(value) - Not directly supported in Apex
        // Workaround: check manually
        Boolean hasAlice = false;
        for (String value : studentMap.values()) {
           if (value == 'Alice') {
             hasAlice = true;
             break;
          }
        }
        System.debug('Contains value "Alice": ' + hasAlice);

        // 6. keySet() - Returns all the keys in the map
        Set<Integer> keys = studentMap.keySet();
        System.debug('All keys: ' + keys); // {101, 102, 103}

        // 7. values() - Returns all values in the map
        List<String> values = studentMap.values();
        System.debug('All values: ' + values); // ['Alice', 'Bob', 'Charlie']

        // 8. size() - Returns the number of key-value pairs
        System.debug('Size of map: ' + studentMap.size()); // 3

        // 9. remove(key) - Removes the entry with the given key
        studentMap.remove(102);
        System.debug('Map after removing key 102: ' + studentMap); // {101 => 'Alice', 103 => 'Charlie'}

        // 10. isEmpty() - Checks if the map is empty
        System.debug('Is map empty?: ' + studentMap.isEmpty()); // false

        // 11. putAll(map) - Adds all entries from another map
        Map<Integer, String> newStudents = new Map<Integer, String>{
            104 => 'David',
            105 => 'Eva'
        };
            
        studentMap.putAll(newStudents);
        System.debug('Map after putAll: ' + studentMap);

        // 12. clone() - Creates a shallow copy of the map
        Map<Integer, String> clonedMap = studentMap.clone();
        System.debug('Cloned map: ' + clonedMap);

        // 13. clear() - Removes all entries from the map
        studentMap.clear();
        System.debug('Map after clear(): ' + studentMap); // {}

        // 14. isEmpty() again
        System.debug('Is map empty now?: ' + studentMap.isEmpty()); // true
    }

}