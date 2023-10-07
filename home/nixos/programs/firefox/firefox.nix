{ options, config, pkgs, ... }:


{

    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "https://search.notrustverify.ch/";
            "browser.search.defaultenginename" = "Whoogle";
            "browser.search.order.1" = "Whoogle";
            
          };


   settings = {
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.download.useDownloadDir" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "dom.security.https_only_mode" = true;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "layout.frame_rate" = 144;
        "generate.smoothScroll.msdPhysics.enabled" = true;
        "mousewheel.min_line_scroll_amount" = 30;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "geo.enabled" = false;
        "media.peerconnection.enabled " = false;
        "privacy.trackingprotection.cryptomining.enabled" = true;
        "privacy.firstparty.isolate" = true;
        "media.navigator.enabled" = false;
        "network.cookie.cookieBehavior" = 3;
        "network.cookie.lifetimePolicy" = 2;
        "network.dns.disablePrefetch" = true;
        "webgl.disabled" = true;
        "network.prefetch-next" = false;
        "dom.event.clipboardevents.enabled" = false;
        "media.eme.enabled" = false;
        "browser.ping-centre.telemetry" = false;
        "extensions.pocket.enabled" = false;
        "signon.rememberSignons" = false;
        "beacon.enabled" = false;
        "browser.send_pings" = false;
        "network.http.referer.XOriginPolicy" = 1;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "browser.sessionstore.privacy_level" = 2;
      };
          search = {
            force = true;
            default = "Whoogle";
            order = [ "Whoogle" "Google" ];
            engines = {
              "Nix Packages" = {
                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };
              "NixOS Wiki" = {
                urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@nw" ];
              };
              "Whoogle" = {
                urls = [{ template = "https://search.notrustverify.ch/search={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@whoogle" ];
              };
              "Bing".metaData.hidden = true;
              "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
            };
          };
    
        };
      };
  };

}
