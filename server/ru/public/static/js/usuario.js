
function eraseCookie(name) {
    document.cookie = name + '=; Max-Age=0'
}

function logout() {
	eraseCookie("token");
    localStorage.setItem("token", "");
    window.location.replace("/");
}

function goToEmployeePage() {
    window.location.href = "/funcionario";
}

function updateUserCounter() {
    $.ajax({
    url: "/api/numeroUsuariosNoRestaurante",
    type: 'GET',
    async: false,
    success: function(data) {
    	$("#userCounter").html(data["numUsuarios"]);
    }
    });
}

function comprarPassesUsuario() {
    var formData = {
        "qtd_passes" : $("#compra-qtd-passes").val()
    };
    console.log(formData);
    $.ajax({
            url: "/api/addPassesUsuario",
            type: 'POST',
            async: false,
            data: formData,
            success: function(data) {
                alert("Créditos adicionados com sucesso!");
                location.reload();
            }
        });
}


$(document).ready(function() {
    updateUserCounter();
    window.setInterval(function(){updateUserCounter();},5000);

    $("#compra-qtd-passes").keyup(function() {
        var qtd = $("#compra-qtd-passes").val();
        var total = qtd*precoPasse;
        $("#compra-preco-total").html(total.toFixed(2));
    });
});
