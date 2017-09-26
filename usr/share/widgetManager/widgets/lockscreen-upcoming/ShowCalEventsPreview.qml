import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.time 1.0
import org.nemomobile.calendar 1.0
import org.nemomobile.configuration 1.0

Item
{
    ConfigurationGroup 
    {
        id: lockscreenUpcomingSettings
        path: "/desktop/lipstick-jolla-home/lockscreenUpcoming"
        property int maxEvents: 5
        property int nDaysForward: 7
        property int daysWeeksMonths: 0
        property color backgroundColor: "grey"
        property color tBorder: "white"
        property color bBorder: "white"
        property color lBorder: "white"
        property color rBorder: "white"
        property bool bgrIsTr: false
        property bool tbrIsTr: false
        property bool bbrIsTr: false
        property bool lbrIsTr: false
        property bool rbrIsTr: false
        property int borderThick: 2
        
        property int dateLabelSize: Theme.fontSizeMedium
        property int timeLabelSize: Theme.fontSizeMedium
        property int eventLabelSize: Theme.fontSizeMedium
        property color dateLabelColor: Theme.highlightColor
        property color timeLabelColor: Theme.primaryColor
        property color eventLabelColor: Theme.primaryColor
        property bool showMessage: false
        onValueChanged: 
        {
            eventUpdater.update()
        }
    }

    function getHeight ()
    {
        var height
        
        if(parent.useanchors) height =dataCol.height + 2* lockscreenUpcomingSettings.borderThick
        else height =  lockscreenUpcomingSettings.maxEvents* (Math.max(lockscreenUpcomingSettings.dateLabelSize, lockscreenUpcomingSettings.timeLabelSize) + lockscreenUpcomingSettings.eventLabelSize) + 2*lockscreenUpcomingSettings.borderThick  
        return height
    }

    width: 415*Screen.width/540
    height: getHeight()
    //anchors.right: parent.right 
    
    Rectangle
    {
        visible: true 
        id: background
        anchors.fill: parent
        color:lockscreenUpcomingSettings.bgrIsTr ? "transparent" : lockscreenUpcomingSettings.backgroundColor 
        opacity: 0.3
        radius: 1
    }
    BorderRectangle 
    {
        visible: true 
        id: borders
        anchors.fill: parent
        backColor: "transparent"
        rightColor: lockscreenUpcomingSettings.rbrIsTr ? "transparent" : lockscreenUpcomingSettings.rBorder
        leftColor: lockscreenUpcomingSettings.lbrIsTr ? "transparent" :lockscreenUpcomingSettings.lBorder
        topColor: lockscreenUpcomingSettings.tbrIsTr ? "transparent" :lockscreenUpcomingSettings.tBorder
        bottomColor: lockscreenUpcomingSettings.bbrIsTr ? "transparent" :lockscreenUpcomingSettings.bBorder
        borderWidth: lockscreenUpcomingSettings.borderThick
    }

    Column
    {
       id: dataCol
       spacing: -Theme.paddingSmall
        y: lockscreenUpcomingSettings.borderThick
       Row 
       {
            id: labelRow
            spacing: Theme.paddingSmall
             x: lockscreenUpcomingSettings.borderThick +  Theme.paddingSmall
            Label 
            {
               id: dateLabel
                                          text: "Date:"
                          font.pixelSize:lockscreenUpcomingSettings.dateLabelSize
                          color:  lockscreenUpcomingSettings.dateLabelColor
            }
            Label 
            {
                id: timeLabel
                                          text: "Time"
                          font.pixelSize:lockscreenUpcomingSettings.timeLabelSize
                          color:  lockscreenUpcomingSettings.timeLabelColor
            }
        }
        Label 
        {
            id: nameLabel
            x:lockscreenUpcomingSettings.borderThick + Theme.paddingSmall
            width: contentWidth
                                      text: "Event"
                          font.pixelSize:lockscreenUpcomingSettings.eventLabelSize
                          color:  lockscreenUpcomingSettings.eventLabelColor
        }
    }
}
 

