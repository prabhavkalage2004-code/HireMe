public  class ChildOfOverrideExample extends ParentOfOverrideExample {
    
    public override void calculator(Integer a, Integer b) {
        Integer sub = a - b;
        System.debug('Difference: ' + sub);
    }

}