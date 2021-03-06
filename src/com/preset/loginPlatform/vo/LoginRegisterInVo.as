/**
 * Created by dingcj on 2017/11/20.
 */
package com.preset.loginPlatform.vo {
public class LoginRegisterInVo {
    public var status:int;//接口返回状态
    public var message:String;//错误信息

    public var expires_at:String;//令牌过期时间
    public var sign:String;//登录签名
    public var t:int;//请求时间戳
    public var token:String;//登录令牌
    public var uid:String;//userId
    public var username:String;//用户名

    public static function createVo(json:Object):LoginRegisterInVo {
        var vo:LoginRegisterInVo = new LoginRegisterInVo();
        vo.status = json["status_code"];
        vo.message = json["message"];
        var obj:Object = json["data"];
        vo.username = obj["username"];
        vo.token = obj["token"];
        vo.sign = obj["sign"];
        vo.expires_at = obj["expires_at"];
        vo.t = obj["t"];
        vo.uid = obj["uid"];
        return vo;
    }
}
}
