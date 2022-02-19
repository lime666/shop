import jquery from 'jquery';
window.jQuery = jquery;
window.$ = jquery;


$('#search').find('#search-field').on('input', function(e){
	
	$('#search-form').submit()
	$('#search-field').focus()
})
