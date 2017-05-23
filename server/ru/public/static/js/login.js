
$(document).ready(function() {
    // DOM ready
    $(".forget-data").hide();

    //Load profile if it exits
    loadProfile();
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
    //Fazer login aqui
    

    //Mostrar mensagem de erro, se o login falhar

    //Senão
    //Salvar token local

    //Salvar dados locais, se o checkbox estiver selecionado
    testLocalStorageData();

    //Redirecionar para área de usuário
    location.reload();
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

function testLocalStorageData() {
    if(!supportsHTML5Storage()) { return false; }
    localStorage.setItem("PROFILE_IMG_SRC", "//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" );
    localStorage.setItem("PROFILE_NAME", "Giovanni Cimolin da Silva");
    localStorage.setItem("PROFILE_MATRICULA", "13106428");
}