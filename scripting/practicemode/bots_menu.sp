public Action Command_BotsMenu(int client, int args) {
  if (!g_InPracticeMode) {
    return Plugin_Handled;
  }

  Menu menu = new Menu(BotsMenuHandler);
  menu.SetTitle("BOT菜单");

  menu.AddItem("place", "放置一个BOT");
  menu.AddItem("crouchplace", "放置一个蹲着的BOT");
  menu.AddItem("load", "载入已保存的BOT位置");
  menu.AddItem("save", "保存当前BOT位置");
  menu.AddItem("clear_bots", "清除所有BOT");
  menu.AddItem("delete", "删除一个BOT");

  menu.Display(client, MENU_TIME_FOREVER);
  return Plugin_Handled;
}

public int BotsMenuHandler(Menu menu, MenuAction action, int param1, int param2) {
  if (action == MenuAction_Select) {
    int client = param1;
    char buffer[OPTION_NAME_LENGTH];
    menu.GetItem(param2, buffer, sizeof(buffer));

    if (StrEqual(buffer, "place")) {
      Command_Bot(client, 0);
    } else if (StrEqual(buffer, "crouchplace")) {
      Command_CrouchBot(client, 0);
    } else if (StrEqual(buffer, "delete")) {
      Command_RemoveBot(client, 0);
    } else if (StrEqual(buffer, "clear_bots")) {
      Command_RemoveBots(client, 0);
    } else if (StrEqual(buffer, "save")) {
      Command_SaveBots(client, 0);
    } else if (StrEqual(buffer, "load")) {
      Command_LoadBots(client, 0);
    }

    Command_BotsMenu(client, 0);
  } else if (action == MenuAction_End) {
    delete menu;
  }

  return 0;
}
