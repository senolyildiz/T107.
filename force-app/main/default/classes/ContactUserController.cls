public with sharing class ContactUserController {



    @AuraEnabled(cacheable=true)
    public static UserContactWrapper getUserInfoByEmail(String contactId) {
       
        Contact contact = [SELECT Name, Email, Id FROM Contact  WHERE id =: contactId AND Email !=Null LIMIT 1] ;
        if(contact !=Null) {
          User user = [SELECT Id, Username, LastName, FirstName, Email FROM User WHERE Email =: cnt.Email LIMIT 1];
          if(user !=Null){
            UserWrapper wrapper= new UserWrapper();
                wrapper.lastName=user.LastName;
                wrapper.firstName=user.FirstName;
                wrapper.email=user.Email;
                wrapper.userId =user.Id;
                wrapper.username =user.username;
                return wrapper;
          }
        }}
public class UserWrapper {
    @AuraEnabled public String lastName { get; set; }
    @AuraEnabled public String email { get; set; }
    @AuraEnabled public String firstName{ get; set; }
    @AuraEnabled public String username { get; set; }
    @AuraEnabled public String userId { get; set; }

}}