function adjustPersonWrapLeft() {
    const personWrap = document.querySelector('.person_wrap');
    const loginDiv = document.querySelector('.user');
    const screenWidth = window.innerWidth;

    let loginWidth = 0;  
    let extraWidth = 0; 

    if (loginDiv) {
        loginWidth = loginDiv.getBoundingClientRect().width;

        
        if (screenWidth === 3840) {
            extraWidth = 54;
        } else if (screenWidth === 1920) {
            extraWidth = 54; 
        } else if (screenWidth === 1080) {
            extraWidth = 27; 
        } else if (screenWidth === 2160) {
            extraWidth = 27; 
        }
    }

    if (screenWidth === 3840) {
        if (loginDiv) {
        personWrap.style.left = loginDiv ? `${2417.54 - loginWidth - extraWidth}px` : '2124.54px';
        }else{
         personWrap.style.left = '2417.54px';  
        }
    } else if (screenWidth === 2160) {
        if (loginDiv) {
        personWrap.style.left = loginDiv ? `calc(55% - ${loginWidth + extraWidth}px)` : '33%';
        }else{
            personWrap.style.left = '55%';  
        }
    } else if (screenWidth === 1920) {
        if (loginDiv) {
        personWrap.style.left = loginDiv ? `${1208.77 - loginWidth - extraWidth}px` : '1062.77px';
        }else{
            personWrap.style.left = '1208.77px';    
        }
    } else if (screenWidth === 1080) {
        if (loginDiv) {
            personWrap.style.left = loginDiv ? `calc(55% - ${loginWidth + extraWidth}px)` : '33%';
            }else{
                personWrap.style.left = '55%';  
            }
    }
}

window.addEventListener('load', adjustPersonWrapLeft);
window.addEventListener('resize', adjustPersonWrapLeft);


