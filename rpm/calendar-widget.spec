Name:          calendar-widget
Version:       0.2
Release:       1
Summary:       Calendar widget for Lock screen
Group:         System/Patches
Vendor:        Anant Gajjar
Distribution:  SailfishOS
Packager: Anant Gajjar
License:       GPL
Requires: widget-manager
Requires: sailfish-version >= 1.1.9
Conflicts: lockscreen-upcoming
BuildArch: noarch

%description
This is a widget for the lockscreen to show the upcoming events. The view is fully configurable using the settings.

%files
/usr/share/widgetManager/widgets/*
/usr/share/jolla-settings/entries/*
/usr/share/jolla-settings/pages/*

%defattr(-,root,root,-)


%post
%preun

%postun
if [ $1 = 0 ]; then
    
dconf reset -f /desktop/lipstick-jolla-home/lockscreenUpcoming/ || true
rm -rf /usr/share/widgetManager/widgets/lockscreen-upcoming || true
rm -rf /usr/share/jolla-settings/pages/lockscreen-upcoming-patch || true
rm -rf /usr/share/jolla-settings/entries/lockscreen-upcoming-patch.json || true 
else
if [ $1 = 1 ]; then
 
echo "It's just upgrade"
fi
fi

%changelog
*  Wed Dec 02 2015 Builder <builder@...>
0.2
- bug fix: Right anchor was hard coded so would cause widget to stretch if placed in the center. 

0.1
- First build.
