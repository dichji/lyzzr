package net.data.sendCmd.group {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author
 */
public class GroupCopyInfoCmd extends BaseCmd {
    public function GroupCopyInfoCmd() {
        this.msgType = MsgConst.GROUP_INFO;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(0x0f);
        }
        catch (e:*) {

        }
    }
}
}