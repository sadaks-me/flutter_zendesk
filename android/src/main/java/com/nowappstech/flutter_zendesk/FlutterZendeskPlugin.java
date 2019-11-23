package com.nowappstech.flutter_zendesk;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import zendesk.commonui.UiConfig;
import zendesk.core.AnonymousIdentity;
import zendesk.core.Identity;
import zendesk.core.Zendesk;
import zendesk.support.Support;
import zendesk.support.guide.HelpCenterActivity;
import zendesk.support.request.RequestActivity;

public class FlutterZendeskPlugin implements MethodCallHandler {

    private static Registrar mRegistrar;

    public static void registerWith(Registrar registrar) {
        mRegistrar = registrar;
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_zendesk");
        channel.setMethodCallHandler(new FlutterZendeskPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, @NonNull Result result) {
        if (call.method.equals("initiate")) {
            String url = call.argument("url");
            String appId = call.argument("appId");
            String clientId = call.argument("clientId");
            Zendesk.INSTANCE.init(mRegistrar.context(), url,
                    appId,
                    clientId);
            List<Long> list = new ArrayList<>();
            list.add(0, 1234L);
            list.add(0, 5678L);
            Identity identity = new AnonymousIdentity();
            Zendesk.INSTANCE.setIdentity(identity);
            Support.INSTANCE.init(Zendesk.INSTANCE);
            HelpCenterActivity.builder()
                    .withArticlesForSectionIds(list)
                    .show(mRegistrar.activity());
            result.success("Zendesk Initialized");
        } else {
            result.notImplemented();
        }
    }
}

