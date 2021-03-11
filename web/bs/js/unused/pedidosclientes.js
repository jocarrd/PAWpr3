var contador = 1;

var buttons = Array.from(document.querySelectorAll('.button-more-details-order'))
var listDetailsOrder = Array.from(document.querySelectorAll('.more-details-order'))

buttons.forEach((button, number) => button.onclick=(
	function(){
		return function() {
			viewDetails(number)
		}
	})()
)

function viewDetails(number) {
	if (contador == 1) {
		buttons[number].classList.remove('icon-line-plus')
		buttons[number].classList.add('icon-line-minus')
		listDetailsOrder[number].style.display = "table-row"
		contador = 0;
	} else {
		contador = 1;
		buttons[number].classList.remove('icon-line-minus')
		buttons[number].classList.add('icon-line-plus')
		listDetailsOrder[number].style.display = "none"
	}
}