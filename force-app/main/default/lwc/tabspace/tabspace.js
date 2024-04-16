import { LightningElement, track } from 'lwc';

export default class Example extends LightningElement {
    @track inputValue = '';

    handleInput(event) {
        this.inputValue = event.target.value;
    }

    handleKeyDown(event) {
        if (event.keyCode === 9) {
            event.preventDefault();

            const inputElement = this.template.querySelector('input');
            const startPosition = inputElement.selectionStart;
            const endPosition = inputElement.selectionEnd;

            // Manually insert spaces at the cursor position
            const spaces = "    ";
            this.inputValue =
                this.inputValue.substring(0, startPosition) +
                spaces +
                this.inputValue.substring(endPosition);

            // Set the selection to include the added spaces
            this.setFocus(startPosition + spaces.length, startPosition + spaces.length);
        }
    }

    setFocus(start, end) {
        this.template.querySelector('input').setSelectionRange(start, end);
    }
}