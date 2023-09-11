public with sharing class ContactUserController {
    public class UserWrapper {
        @AuraEnabled
        public User user { get; set; }
        @AuraEnabled
        public String message { get; set; }
    }

    @AuraEnabled(cacheable=true)
    public static UserWrapper getUserInfoByEmail(String contactId) {
        UserWrapper result = new UserWrapper();
        Contact contact = [SELECT Email FROM Contact WHERE Id = :contactId LIMIT 1];
        
        if (contact != null && !String.isBlank(contact.Email)) {
            result.user = [SELECT Id, Name, Email FROM User WHERE Email = :contact.Email LIMIT 1];
            System.debug('UserWrapper Data: ' + result);
        } else {
            result.message = 'Contact does not have an email address.';
        }
        System.debug('UserWrapper Data: ' + result);
        return result;
       

    }
}
