
$(document).ready(function() {
    // DOM ready
    $(".forget-data").hide();
    $("#erro-login").hide();
    //Load profile if it exits
    loadProfile();

    document.getElementById('login-btn').onclick = function(){
        login();
    }
});

/**
 * Function that gets the data of the profile in case
 * thar it has already saved in localstorage. Only the
 * UI will be update in case that all data is available
 *
 * A not existing key in localstorage return null
 *
 */
function getLocalProfile(callback){
    var profileImgSrc      = localStorage.getItem("PROFILE_IMG_SRC");
    var profileName        = localStorage.getItem("PROFILE_NAME");
    var profileReAuthMatricula = localStorage.getItem("PROFILE_MATRICULA");

    if(profileName !== null
            && profileReAuthMatricula !== null
            && profileImgSrc !== null) {
        callback(profileImgSrc, profileName, profileReAuthMatricula);
    }
}

function login(){
    if($('#remember').is(":checked"))
    {
        var saveLocalData = true;
    }

    var formData = {
        "matricula": $("#matricula").val(),
        "senha":     $("#password").val()
    };

    //Fazer login aqui
    var login = false;
    var loginData = {};

    $.ajax({
        url: "/api/token",
        type: 'POST',
        async: false,
        data: formData,
        error : function(err) {
            console.log('Errod de login!', err)
        },
        success: function(data) {
            if (data["status"]=="OK"){
                login = true
                loginData = data
            }
        }
    });

    //Mostrar mensagem de erro, se o login falhar
    if (!login)
    {
        $( "#login-container" ).effect( "shake" );
        $("#erro-login").show();
        return;
    }

    //Senão
    //Salvar token local
    localStorage.setItem("token", loginData["token"]);
    tipo_usuario = loginData["tipo_usuario"];


    //Salvar dados locais, se o checkbox estiver selecionado
    if (saveLocalData){
        $.ajax({
            url: "/api/saveLocalData",
            type: 'POST',
            async: false,
            data: formData,
            success: function(data) {
                localStorage.setItem("PROFILE_IMG_SRC", data["imagem"]);
                localStorage.setItem("PROFILE_NAME", data["nome"]);
                localStorage.setItem("PROFILE_MATRICULA", data["matricula"]);
            },
            headers: {"Authorization": localStorage.getItem('token')}
        });
    }

    //Redirecionar para área de usuário
    if (tipo_usuario=="funcionario")
    {
        location.assign("/funcionario");
    }
    else
    {
        location.assign("/aluno");
    }
}

function loadProfile() {
    if(!supportsHTML5Storage()) { return false; }

    getLocalProfile(function(profileImgSrc, profileName, profileReAuthMatricula) {
        $("#profile-img").attr("src",profileImgSrc);
        $("#nome").html(profileName);
        $("#matricula-salva").html(profileReAuthMatricula);
        $("#matricula").hide();
        $("#remember_div").hide();
        $(".forget-data").show();
    });
}

function forgetProfile() {
    localStorage.clear();
    location.reload();
}

function supportsHTML5Storage() {
    try {
        return 'localStorage' in window && window['localStorage'] !== null;
    } catch (e) {
        return false;
    }
}
