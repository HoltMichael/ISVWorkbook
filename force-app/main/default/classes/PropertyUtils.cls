public with sharing class PropertyUtils {

    @AuraEnabled(cacheable=true)
    public static List<MapMarker> getPropertyAddress(id recId) {
        system.debug(recId);
        workbook001__Property__c prop = [SELECT workbook001__street__c, workbook001__city__c, workbook001__state__c, workbook001__country__c, workbook001__post_code__c FROM workbook001__Property__c WHERE id =: recId][0];     

        Location loc = new Location(prop.workbook001__street__c, prop.workbook001__city__c, prop.workbook001__state__c, prop.workbook001__post_code__c, prop.workbook001__country__c);
        MapMarker mark = new MapMarker('icon', 'title', 'description', loc);
        List<MapMarker> locs = new List<MapMarker>{mark};
        return locs;
    }


    public class MapMarker{
        @AuraEnabled 
        public String icon;  
        @AuraEnabled 
        public String title;  
        @AuraEnabled
        public String description;
        @AuraEnabled 
        public Location location;

        public MapMarker(String i, String t, String d, Location l){
            icon = i;
            title = t;
            description = d;
            location = l;
        }
    }

    public class Location{
        @AuraEnabled 
        public String Street;
        @AuraEnabled 
        public String PostalCode;
        @AuraEnabled 
        public String City;
        @AuraEnabled 
        public String State; 
        @AuraEnabled 
        public String Country; 

        public Location(String strt, String cit, String stat, String pc, String ctry){
            Street = strt;
            City = cit;
            State = stat;
            PostalCode = pc;
            Country = ctry;
        }
    }
}
