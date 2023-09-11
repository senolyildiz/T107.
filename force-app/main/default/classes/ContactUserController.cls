public with sharing class ContactUserController {
    public class UserWrapper {
        @AuraEnabled
        public User user { get; set; }
        @AuraEnabled
        public String message { get; set; }
        @AuraEnabled
        public List<Contact> cntList{get; set;}
    }

    @AuraEnabled(cacheable=true)
    public static UserWrapper getUserInfoByEmail(String contactId) {

        list<Contact> cntlist = [SELECT Name, Email, Id FROM Contact ] ;
        for (Contact con: conlist){
            if(con.Email!=null){
                List<User> user = [SELECT Id, Username, LastName, FirstName, Email, ContactId FROM User WHERE ContactId =: con.Id];

            }
        
       
       
            
        }
        UserWrapper result = new UserWrapper();
        Contact contact = [SELECT Email FROM Contact WHERE Id = :contactId LIMIT 1];
        
        if (contact != null && !String.isBlank(contact.Email)) {
            result.user = [SELECT Id, Name, Email FROM User WHERE Email = :contact.Email LIMIT 1];
        } else {
            result.message = 'Contact does not have an email address.';
        }
        return result;
    }
}

public with sharing class CurrentUserandContactController {
    @AuraEnabled(Cacheable=true)
    public static WClass theMethod(){

        list<Contact> c = [SELECT Name, Id FROM Contact ;
        List<User> u = [SELECT Id, Username, LastName, FirstName, Email, ContactId FROM User WHERE ContactId =: c.Id];
        WClass gudObj =  new WClass(u[0].Account.Name, c[0].Name);
        return gudObj;

    }

    public class WClass {
        @AuraEnabled
        public String usr{get; set;}
        @AuraEnabled
        public String ctct{get; set;}

        public WClass(String u, String ctct){
            this.usr = u;
            this.ctct = ctct;
        }
    }
}