public with sharing class ContactUserController {



    @AuraEnabled(cacheable=true)
    public static UserContactWrapper getUserInfoByEmail(String contactId) {
       
        Contact cnt = [SELECT Name, Email, Id FROM Contact  WHERE id =: contactId LIMIT 1] ;
        List<User> userlist = [SELECT Id, Username, LastName, FirstName, Email FROM User WHERE Email =: cnt.Email];
               list<UserWrapper> wrapperlist= new list<UserWrapper>();

            if(con.Email!=null){
              for(User user: userlist) {
                UserWrapper wrapper= new UserWrapper();
                wrapper.lastName=user.LastName;
                wrapper.FirstName=user.FirstName;
                wrapper.Email=user.Email;
                wrapper.Id =user.Id;
               wrapperlist.add(wrapper);
              }

            UserContactWrapper usercon = new UserWrapper();
            usercon.userinfo= user;
            
            }
            return wrapperlist;
        }
      
       
  

public class UserWrapper {
    @AuraEnabled public string userinfo { get; set; }
    @AuraEnabled public String message { get; set; }
    @AuraEnabled public String LastName { get; set; }
    @AuraEnabled public String Email { get; set; }
    @AuraEnabled public String FirstName{ get; set; }
    @AuraEnabled public String UserName { get; set; }
    @AuraEnabled public String Id { get; set; }

}}