function deleteStudents() {

    var checkedCheckboxes = document.querySelectorAll('input[name=idStudent]:checked');
    if (checkedCheckboxes.length == 0) {
        alert("Пожалуйста, выберете хотя бы одного студента.");
        return;
    }
    var ids = '';

    for (var i = 0; i < checkedCheckboxes.length; i++) {
        ids = ids + checkedCheckboxes[i].value + ' ';
    }
    document.getElementById("idsHiddenDelete").value = ids;
    document.getElementById("deleteForm").submit();
}
function modifyStudent() {

    var checkedCheckboxes = document.querySelectorAll('input[name=idStudent]:checked');
    if (checkedCheckboxes.length == 0) {
        alert("Пожалуйста, выберете только одного студента.");
        return;
    }
    if (checkedCheckboxes.length > 1) {
        alert("Пожалуйста, выберете только одного студента.");
        return;
    }
    var id = checkedCheckboxes[0].value;

    document.getElementById("idsHiddenModify").value = id;
    document.getElementById("modifyForm").submit();
}

function deleteDisciplines(){
    var checkedCheckboxes = document.querySelectorAll('input[name=idDiscipline]:checked');
    if (checkedCheckboxes.length == 0) {
        alert("Пожалуйста, выберете хотя бы одну дисциплину.");
        return;
    }
    var ids = '';

    for (var i = 0; i < checkedCheckboxes.length; i++) {
        ids = ids + checkedCheckboxes[i].value + ' ';
    }
    document.getElementById("deleteHidden").value = ids;
    document.getElementById("deleteForm").submit();
}

function modifyDiscipline(){
    var checkedCheckboxes = document.querySelectorAll('input[name=idDiscipline]:checked');
    if (checkedCheckboxes.length == 0) {
        alert("Пожалуйста, выберете одну дисциплину.");
        return;
    }
    if (checkedCheckboxes.length > 1) {
        alert("Пожалуйста, выберете одну дисциплину.");
        return;
    }
    var id = checkedCheckboxes[0].value;

    document.getElementById("modifyHidden").value = id;
    document.getElementById("modifyForm").submit();
}