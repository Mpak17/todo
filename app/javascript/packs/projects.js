$(document).on('ready turbolinks:load', function() {

    var button = document.querySelector('button')
    var form_id = document.querySelector('#form_id')

    function buttonHandler () {
        form_id.classList.remove('invisible')
    }

    button.addEventListener('click', buttonHandler)

})
