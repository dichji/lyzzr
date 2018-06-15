/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.battle.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.module.battle.view.ExpertView;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class ExpertMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "ExpertMediator";

    private function get view():ExpertView {
        return getViewComponent() as ExpertView;
    };
    public function ExpertMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.closeSignal.getSignal(this).listen(onCloseClick);
    }

    private function onCloseClick():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.EXPERT_VIEW, MenuWindowVO.CLOSE)));
    }

    private function instanceCompleteHander():void {
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case "":
                break;
        }
    }
}
}