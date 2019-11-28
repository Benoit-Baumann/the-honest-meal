import "bootstrap";
import { initTabListener, initMainSignupBtnListener, initSendReviewBtnListener } from './modal_listener';
import { initStarRating, initStarRating2 } from '../plugins/init_star_rating';
// import '../components/drag-drop';
import '../components/showqs';
import { initQuestionTypeBtnListener } from "./question_type_btn_listener";

initStarRating();
initStarRating2();
initTabListener();
initMainSignupBtnListener();
initSendReviewBtnListener();
initQuestionTypeBtnListener();