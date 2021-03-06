/**
 * Created by dangww on 2018/1/12.
 */
package com.game.module.tweenpack.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.tweenpack.view.GoodsItemTweenPack;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class GoodsItemTweenPackMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "GoodsItemTweenPackMediator";

    private function get view():GoodsItemTweenPack{
        return getViewComponent() as GoodsItemTweenPack;
    };
    public function GoodsItemTweenPackMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
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