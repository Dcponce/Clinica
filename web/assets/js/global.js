(function() {
  'use strict';
  window.addEventListener('load', function() {
    var forms = document.getElementsByClassName('needs-validation');
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

$(document).ready(function(){
	$('#cliente').click(function(){
		location.href="cliente.php";
	});
	$('#conductor').click(function(){
		location.href="Conductor.php";
	});
	$('#empleado').click(function(){
		location.href="empleado.php";
	});
    $('#vehiculo').click(function(){
		location.href="vehiculo.php";
	});
    $('#usuario').click(function(){
		location.href="usuario.php";
	});
});