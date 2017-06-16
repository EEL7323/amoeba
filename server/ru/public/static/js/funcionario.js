
$(document).ready(function() {

	$('#form-cadastro-aluno').ajaxForm(function() {
        alert("Usuário adicionado!");
    });

    $('#submitAddPasses').click(function() {
    	addCredits();
    });

});

function goToUserPage() {
    window.location.href = "/usuario";
}

function addCredits() {
    alert("Créditos adicionados com sucesso!");
}
