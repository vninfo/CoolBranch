$(document).ready(function(){

    //$('#formUpload').dropzone({
    //    url: '',
    //    maxFilesize: 2, // MB
    //    uploadMultiple: false,
    //    autoProcessQueue: false,
    //    addRemoveLinks: true,
    //    dictRemoveFile: 'Thay ảnh',
    //    maxFiles: 1,
    //    thumbnailHeight: 200,
    //    thumbnailWidth: 200,
    //    init: function() {
    //        dropzone = this;
    //    },
    //    maxfilesexceeded: function(){
    //        $('.dz-error').remove();
    //    },
    //    success: function(file, response) {
    //        dropzone.removeAllFiles(true);
    //    }
    //});

});

/* Common script */

function isEmail(s) {
	if (s.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]{2,4}$/) != -1)
		return true;
	return false;
}

function resetForm(formID){
	$("#" + formID).each (function() { this.reset(); });
	return false;
}

function browseFile(uploadBtnID, formID, avatarField, avatarImgClass, uploadURL, loadImgURL){
	var btnUpload=$('#' + uploadBtnID);
	var ajaxUpload = new AjaxUpload(btnUpload, {
		action: uploadURL,
		name: 'file',
		onSubmit: function(file, ext){
			//showLoading();
			 if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){
				// extension is not allowed
				jAlert('Only accept image with JPG, PNG, GIF format');
				return false;
			}
		},
		onComplete: function(file, response){
			//On completion clear the status
			response = $.parseJSON(response);
			//Add uploaded file to list
			if(response.code === "success"){
				$('.' + avatarImgClass).html('<img src="' + loadImgURL + '/' + response.msg + '" />');
				$("#" + formID + " input[name=" + avatarField + "]").val(response.msg);
			} else{
				jAlert(response.msg);
			}
		}
	});
};

function split( val ) {
	return val.split( /,\s*/ );
}
function extractLast( term ) {
	return split( term ).pop();
}

function checkExtensions(fileName){
    if (!(/\.(gif|jpg|jpeg|tiff|png)$/i).test(fileName)) {
        return false;
    }
}

function isDate(txtDate){
    var currVal = txtDate;
    if(currVal == '')
       return false;
    var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{1,4})$/;
    var dtArray = currVal.match(rxDatePattern); // is format OK?
    if (dtArray == null)
        return false;
    //Checks for mm/dd/yyyy format.
    dtMonth = dtArray[1];
    dtDay= dtArray[3];
    dtYear = dtArray[5];
    if (dtMonth < 1 || dtMonth > 12)
        return false;
    else if (dtDay < 1 || dtDay> 31)
        return false;
    else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31)
        return false;
    else if (dtMonth == 2){
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay> 29 || (dtDay ==29 && !isleap))
            return false;
    }
  return true;
}