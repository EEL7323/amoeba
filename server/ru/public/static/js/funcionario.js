
$(document).ready(function() {

	$('#form-cadastro-aluno').ajaxForm(function() {
        alert("Usuário adicionado!");
    });

    $( ".botaoVincularCarteirinha" ).click(function() {
    	var idLinha = $(this).parents("tr").children().first().html();
	  	vincularCarteirinha(idLinha);
	});

});

function goToUserPage() {
    window.location.href = "/usuario";
}

function vincularCarteirinha(idLinha) {
	var formData = {
		"matricula" : $('#matricula_vincular_'+idLinha).val(),
		"identifier": $('#indentificador_'+idLinha).html()
	}
	$.ajax({
        url: "/api/vincularCarteirinha",
        type: 'POST',
        async: false,
        data: formData,
        success: function(data) {
            alert("Carteirinha vinculada com sucesso!");
            location.reload();
        }
    });
}

function comprarPassesFuncionario() {
    var formData = {
        "qtd_passes" : $("#adicionar-credito-qtd-passes").val(),
        "matricula" : $("#adicionar-credito-matricula").val()
    };
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
