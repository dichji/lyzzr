/**
 * Created by dingcj on 2018/6/23.
 */
package com.game.module.copy.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.module.copy.view.CopyMopView;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class CopyMopMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "CopyMopMediator";

    private function get view():CopyMopView {
        return getViewComponent() as CopyMopView;
    };
    public function CopyMopMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.clickSignal.getSignal(this).listen(onClick);
    }

    private function instanceCompleteHander():void {
        view.mopUp([]);
    }

    private function onClick():void {
        if (!view.isFinished) {
            view.finishImmediatly();
        }
        else {
            dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COPY_MOP_VIEW, MenuWindowVO.CLOSE)));
        }
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