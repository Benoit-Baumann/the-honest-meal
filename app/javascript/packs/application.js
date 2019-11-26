import "bootstrap";
import { initTabListener, initJoinUsBtn} from './modal_login_form';
import { initStarRating, initStarRating2 } from '../plugins/init_star_rating';
import { closeShareReviewModal } from './modal_share_review'
import '../components/drag-drop';
import '../components/minusq';

initStarRating();
initStarRating2();
initTabListener();
initJoinUsBtn();
closeShareReviewModal();