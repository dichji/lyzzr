/**
 * Created by dingcj on 2018/5/15.
 */
package com.game.module.tavern.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.operation.Oper;
import com.game.common.operation.TweenOper;
import com.game.common.view.BaseFrame;
import com.game.common.vo.BaseMenuVO;
import com.game.module.tavern.mediator.TavernMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;

import ui.tavern.TavernViewUI;

public class TavernView extends BaseFrame {

    private var resArr:Array =
            [
                "许愿树素材",
                //{url: "ui/bg/back_cardluck.png/back_cardluck.png", type: Loader.IMAGE}
            ];

    private var ui:TavernViewUI;
    private var dir:int = 1;//1?stone:gold
    private var leftPos = 0;
    private var rightPos = 1300;
    private var oper:Oper;

    public var tuSignal:SignalDispatcher;
    public var oneSignal:SignalDispatcher;
    public var tenSignal:SignalDispatcher;

    public function TavernView() {
        super([resArr]);

        tuSignal = new SignalDispatcher();
        oneSignal = new SignalDispatcher();
        tenSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new TavernMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
        init();
        adapt();
    }

    private function __onComplete():void {
        ui = new TavernViewUI();
        addChild(ui);
    }

    private function init():void {
        dir = 1;
        refresh();

        ui.tuBtn.on(Event.CLICK, this, onClickTuBtn);
        ui.leftBtn.on(Event.CLICK, this, onClickLeftBtn);
        ui.rightBtn.on(Event.CLICK, this, onClickRightBtn);
        ui.oneBtn.on(Event.CLICK, this, onClickOneBtn);
        ui.tenBtn.on(Event.CLICK, this, onClickTenBtn);

        ui.panel.mouseEnabled = false;
    }

    private function onClickTuBtn(e:Event):void {
        tuSignal.dispatch(null);
    }

    private function onClickTenBtn(e:Event):void {
        tenSignal.dispatch(null);
    }

    private function onClickOneBtn(e:Event):void {
        oneSignal.dispatch(null);
    }

    private function onClickRightBtn(e:Event):void {
        scrollTo(-1);
    }

    private function onClickLeftBtn(e:Event):void {
        scrollTo(1);
    }

    private function scrollTo(dir:int) {
        this.dir = dir;
        var dirPos:int = dir == -1 ? rightPos : leftPos;
        if (oper) {
            oper.halt();
            oper = null;
        }

        oper = new Oper();
        oper.add(new TweenOper(ui.panel.hScrollBar, 400, {value: dirPos}, null));
        oper.list.forEach(function (item:Oper) {
            item.do_execute();
        });

        timerOnce(300, this, refresh);
    }

    public function refresh():void {
        trace("收到响应");
        ui.leftBtn.visible = dir == -1;
        ui.rightBtn.visible = dir == 1;
    }

    private function adapt():void {
        setTitle("许愿树");
        setContent(ui);
        setToolBarItems([new BaseMenuVO("酒馆招募")]);
        ui.x = (Laya.stage.width - ui.width) / 2;
    }

    override public function toolBarSelectHandler(index:int):void {
        super.toolBarSelectHandler(index);
    }

    override public function dispose():void {
        super.dispose();

        if (oper) {
            oper.halt();
            oper = null;
        }

        ui.tuBtn.off(Event.CLICK, this, onClickTuBtn);
        ui.leftBtn.off(Event.CLICK, this, onClickLeftBtn);
        ui.rightBtn.off(Event.CLICK, this, onClickRightBtn);
        ui.oneBtn.off(Event.CLICK, this, onClickOneBtn);
        ui.tenBtn.off(Event.CLICK, this, onClickTenBtn);

        tuSignal.dispose();
        oneSignal.dispose();
        tenSignal.dispose();
    }
}
}