import { LightningElement, track } from 'lwc';

export default class ViewMessageText extends LightningElement {
@track message;

messageHandler (event){
    this.message=event.target.value;
}

}