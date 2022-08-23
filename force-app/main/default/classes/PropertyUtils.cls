public with sharing class PropertyUtils {

    @AuraEnabled(cacheable=true)
    public static List<MapMarker> getPropertyAddress(id recId) {
        system.debug(recId);
        Property__c prop = [SELECT street__c, city__c, state__c, country__c, post_code__c FROM Property__c WHERE id =: recId][0];     

        Location loc = new Location(prop.street__c, prop.city__c, prop.state__c, prop.post_code__c, prop.country__c);
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
