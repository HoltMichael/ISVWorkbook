@isTest
public with sharing class PropertyUtils_Test {
    @testSetup
    static void propertyUtilsTestSetup(){
        workbook001__property__c property = new workbook001__property__c(
            workbook001__street__c = '415 Mission St',
            workbook001__City__c = 'San Francisco',
            workbook001__Post_code__c = 'CA 94105',
            workbook001__Country__c = 'United States');
        insert property;   
    }

    @isTest
    static void getPropertyAddressTest(){
        workbook001__property__c property = [SELECT id FROM workbook001__property__c][0];
        test.startTest();
            propertyUtils.MapMarker result = PropertyUtils.getPropertyAddress(property.id)[0];
        test.stopTest();
        
        system.assert(result.location.Street == '415 Mission St');
        system.assert(result.location.City == 'San Francisco');
        system.assert(result.location.PostalCode == 'CA 94105');
        system.assert(result.location.Country == 'United States');
    } 
}
