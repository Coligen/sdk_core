import { SDKCore } from '@mopen/core';
import AbilityStage from '@ohos.app.ability.AbilityStage';
import type Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

export default class EntryAbilityStage extends AbilityStage {
  onCreate(): void {
    hilog.debug(0x00, "EntryAbilityStage", "EntryAbilityStage onCreate");
    let context = this.context.getApplicationContext();
    SDKCore.init(context, "2025713681", "0985a99f25017534bf2c39323bf8b6ec4325c9c007f4de80eecac1e1eeab39e9");
  }

  onAcceptWant(want: Want): string {
    // 仅specified模式下触发
    return 'EntryAbilityStage';
  }
}