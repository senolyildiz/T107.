import { LightningElement, api, wire } from 'lwc';
import getUserInfoByEmail from '@salesforce/apex/ContactUserController.getUserInfoByEmail';

export default class ContactUserLookup extends LightningElement {
    @api recordId;
    userInfo;

    @wire(getUserInfoByEmail, { contactId: '$recordId' })
    wiredUserInfo({ error, data }) {
        if (data) {
            this.userInfo = data;
        } else if (error) {
            console.error(error);
        }
    }
}
