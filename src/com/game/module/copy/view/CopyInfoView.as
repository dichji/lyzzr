/**
 * Created by dingcj on 2018/5/23.
 */
package com.game.module.copy.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseFrame;
import com.game.module.copy.mediator.CopyInfoMediator;
import com.game.module.copy.view.items.PropertyItem;
import com.game.module.pack.view.ItemCell;
import com.signal.SignalDispatcher;

import config.stage.IstageCfg;

import laya.events.Event;
import laya.utils.Handler;

import ui.copy.CopyInfoViewUI;

public class CopyInfoView extends BaseFrame {

    private var ui:CopyInfoViewUI;
    public var closeSignal:SignalDispatcher;
    public var startSignal:SignalDispatcher;
    public var onceSignal:SignalDispatcher;
    public var fiveSignal:SignalDispatcher;
    public var cfg:IstageCfg;

    public function CopyInfoView() {
        super();
        closeSignal = new SignalDispatcher();
        startSignal = new SignalDispatcher();
        onceSignal = new SignalDispatcher();
        fiveSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new CopyInfoMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        this.cfg = _data[0] as IstageCfg;
        ui = new CopyInfoViewUI();
        addChild(ui);
        init();
        adapt();
    }

    private function adapt():void {
        setContent(ui);
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);
        ui.startBtn.on(Event.CLICK, this, onClickStartBtn);
        ui.onceBtn.on(Event.CLICK, this, onClickOnceBtn);
        ui.fiveBtn.on(Event.CLICK, this, onClickFiveBtn);
        ui.list.itemRender = ItemCell;
        ui.list.renderHandler = Handler.create(this, onRenderItem, null, false);

        ui.list.repeatX = 4;
        ui.list.repeatY = 1;

        ui.list.spaceX = 20;

        ui.propertyList.itemRender = PropertyItem;
        ui.propertyList.renderHandler = Handler.create(this, onRenderPropertyItem, null, false);

        ui.propertyList.repeatX = 4;
        ui.propertyList.repeatY = 1;

        ui.propertyList.spaceX = 10;

        initInfo();
    }

    private function initInfo():void {
        ui.introduceLabel.text = cfg.stageIntroduce;
        ui.costLabel.text = "消耗体力 " + cfg.vitality;

        //关卡属性
        ui.list.array = cfg.reward.split('|');
    }

    private function onRenderPropertyItem(cell:PropertyItem, index:int):void {

    }

    private function onRenderItem(cell:ItemCell, index:int):void {
        var strs:Array = ui.list.array[index].split('_');
//        cell.setData({itemid: strs[0], itemNum: strs[1]});
    }

    private function onClickFiveBtn(e:Event):void {
        if (fiveSignal)fiveSignal.dispatch(null);
    }

    private function onClickOnceBtn(e:Event):void {
        if (onceSignal)onceSignal.dispatch(null);
    }

    private function onClickStartBtn(e:Event):void {
        if (startSignal)startSignal.dispatch(null);
    }

    private function onClickCloseBtn(e:Event):void {
        closeSignal.dispatch(null);
    }

    override public function dispose():void {
        super.dispose();
        if (ui.list.renderHandler)ui.list.renderHandler.clear();
        if (ui.propertyList.renderHandler)ui.propertyList.renderHandler.clear();
        closeSignal.dispose();
        startSignal.dispose();
        onceSignal.dispose();
        fiveSignal.dispose();
        ui.closeBtn.off(Event.CLICK, this, onClickCloseBtn);
        ui.startBtn.off(Event.CLICK, this, onClickStartBtn);
        ui.onceBtn.off(Event.CLICK, this, onClickOnceBtn);
        ui.fiveBtn.off(Event.CLICK, this, onClickFiveBtn);
    }
}
}