package com.game.command {

import com.game.module.copy.command.CopyCommand;
import com.game.module.map.command.MapStartupCommand;
import com.game.module.redPoint.command.RedPointStartupCommand;
import com.game.module.share.command.ShareStartupCommand;
import com.game.module.task.command.TaskStartupCommand;
import com.game.module.tavern.command.TavernStartUpCommand;
import com.game.module.user.command.UserStartupCommand;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.patterns.command.MacroCommand;

public class GameInitCommand extends MacroCommand implements ICommand {
    public function GameInitCommand() {
    }

    override protected function initializeMacroCommand():void {
        trace("GameInitCommand");
        addSubCommand(TavernStartUpCommand);
        addSubCommand(CopyCommand);
        return;
        addSubCommand(UserStartupCommand);
        addSubCommand(TaskStartupCommand);
        addSubCommand(MapStartupCommand);
        addSubCommand(RedPointStartupCommand);
        addSubCommand(ShareStartupCommand);
    }
}
}