import { LightningElement, api, wire } from 'lwc';
import getUserInfoByEmail from '@salesforce/apex/ContactUserController.getUserInfoByEmail';

export default class ContactUser extends LightningElement {
    @api recordId;
    @api userFound=false;
    @api userNotFound=false;
    @api contactHasNoEmail=false;
    @api userInfo;

    

    @wire(getUserInfoByEmail, { contactId: '$recordId' })
   
    wiredUserInfo({ error, data }) {
        if (data) {
            this.userFound=true;
            this.userInfo = data;
        } else if (error) {
            console.error(error);
        } else {
            // User not found or contact doesn't have an email
            const contactWithoutEmail= this.recordId && !this.userInfo.email;
            this.contactHasNoEmail= contactWithoutEmail;
            this.userNotFound= !contactWithoutEmail;
        }
    }
}
