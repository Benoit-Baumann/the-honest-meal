import "bootstrap";
import { initTabListener, initMainSignupBtnListener, initSendReviewBtnListener } from './modal_listener';
import { initStarRating, initStarRating2 } from '../plugins/init_star_rating';
import '../components/drag-drop';
import '../components/showqs';

initStarRating();
initStarRating2();
initTabListener();
initMainSignupBtnListener();
initSendReviewBtnListener();
