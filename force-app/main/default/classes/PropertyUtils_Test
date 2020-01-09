@isTest
public with sharing class PropertyUtils_Test {
    @testSetup
    static void propertyUtilsTestSetup(){
        FirstApp001__property__c property = new FirstApp001__property__c(
            FirstApp001__street__c = '415 Mission St',
            FirstApp001__City__c = 'San Francisco',
            FirstApp001__Post_code__c = 'CA 94105',
            FirstApp001__Country__c = 'United States');
        insert property;   
    }

    @isTest
    static void getPropertyAddressTest(){
        FirstApp001__property__c property = [SELECT id FROM FirstApp001__property__c][0];
        test.startTest();
            propertyUtils.MapMarker result = PropertyUtils.getPropertyAddress(property.id)[0];
        test.stopTest();
        
        system.assert(result.location.Street == '415 Mission St');
        system.assert(result.location.City == 'San Francisco');
        system.assert(result.location.PostalCode == 'CA 94105');
        system.assert(result.location.Country == 'United States');
    } 
}
