
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

function comprarPassesFuncionario() {
    var formData = {
        "qtd_passes" : $("#adicionar-credito-qtd-passes").val(),
        "matricula" : $("#adicionar-credito-matricula").val()
    };
    console.log(formData);
    $.ajax({
            url: "/api/addPassesFuncionario",
            type: 'POST',
            async: false,
            data: formData,
            success: function(data) {
                alert("Créditos adicionados com sucesso!");
                location.reload();
            }
        });
}
