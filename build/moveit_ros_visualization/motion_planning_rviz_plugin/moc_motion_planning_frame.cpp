/****************************************************************************
** Meta object code from reading C++ file 'motion_planning_frame.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/moveit/moveit_ros/visualization/motion_planning_rviz_plugin/include/moveit/motion_planning_rviz_plugin/motion_planning_frame.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'motion_planning_frame.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_moveit_rviz_plugin__MotionPlanningFrame_t {
    QByteArrayData data[66];
    char stringdata0[1465];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_moveit_rviz_plugin__MotionPlanningFrame_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_moveit_rviz_plugin__MotionPlanningFrame_t qt_meta_stringdata_moveit_rviz_plugin__MotionPlanningFrame = {
    {
QT_MOC_LITERAL(0, 0, 39), // "moveit_rviz_plugin::MotionPla..."
QT_MOC_LITERAL(1, 40, 16), // "planningFinished"
QT_MOC_LITERAL(2, 57, 0), // ""
QT_MOC_LITERAL(3, 58, 28), // "databaseConnectButtonClicked"
QT_MOC_LITERAL(4, 87, 25), // "publishSceneButtonClicked"
QT_MOC_LITERAL(5, 113, 29), // "planningAlgorithmIndexChanged"
QT_MOC_LITERAL(6, 143, 5), // "index"
QT_MOC_LITERAL(7, 149, 20), // "resetDbButtonClicked"
QT_MOC_LITERAL(8, 170, 20), // "approximateIKChanged"
QT_MOC_LITERAL(9, 191, 5), // "state"
QT_MOC_LITERAL(10, 197, 17), // "planButtonClicked"
QT_MOC_LITERAL(11, 215, 20), // "executeButtonClicked"
QT_MOC_LITERAL(12, 236, 27), // "planAndExecuteButtonClicked"
QT_MOC_LITERAL(13, 264, 17), // "stopButtonClicked"
QT_MOC_LITERAL(14, 282, 22), // "allowReplanningToggled"
QT_MOC_LITERAL(15, 305, 7), // "checked"
QT_MOC_LITERAL(16, 313, 19), // "allowLookingToggled"
QT_MOC_LITERAL(17, 333, 33), // "allowExternalProgramCommunica..."
QT_MOC_LITERAL(18, 367, 6), // "enable"
QT_MOC_LITERAL(19, 374, 27), // "pathConstraintsIndexChanged"
QT_MOC_LITERAL(20, 402, 26), // "useStartStateButtonClicked"
QT_MOC_LITERAL(21, 429, 25), // "useGoalStateButtonClicked"
QT_MOC_LITERAL(22, 455, 21), // "onClearOctomapClicked"
QT_MOC_LITERAL(23, 477, 23), // "importFileButtonClicked"
QT_MOC_LITERAL(24, 501, 22), // "importUrlButtonClicked"
QT_MOC_LITERAL(25, 524, 23), // "clearSceneButtonClicked"
QT_MOC_LITERAL(26, 548, 17), // "sceneScaleChanged"
QT_MOC_LITERAL(27, 566, 5), // "value"
QT_MOC_LITERAL(28, 572, 21), // "sceneScaleStartChange"
QT_MOC_LITERAL(29, 594, 19), // "sceneScaleEndChange"
QT_MOC_LITERAL(30, 614, 25), // "removeObjectButtonClicked"
QT_MOC_LITERAL(31, 640, 30), // "selectedCollisionObjectChanged"
QT_MOC_LITERAL(32, 671, 22), // "objectPoseValueChanged"
QT_MOC_LITERAL(33, 694, 22), // "collisionObjectChanged"
QT_MOC_LITERAL(34, 717, 16), // "QListWidgetItem*"
QT_MOC_LITERAL(35, 734, 4), // "item"
QT_MOC_LITERAL(36, 739, 17), // "imProcessFeedback"
QT_MOC_LITERAL(37, 757, 46), // "visualization_msgs::Interacti..."
QT_MOC_LITERAL(38, 804, 8), // "feedback"
QT_MOC_LITERAL(39, 813, 27), // "copySelectedCollisionObject"
QT_MOC_LITERAL(40, 841, 25), // "exportAsTextButtonClicked"
QT_MOC_LITERAL(41, 867, 27), // "importFromTextButtonClicked"
QT_MOC_LITERAL(42, 895, 22), // "saveSceneButtonClicked"
QT_MOC_LITERAL(43, 918, 24), // "planningSceneItemClicked"
QT_MOC_LITERAL(44, 943, 22), // "saveQueryButtonClicked"
QT_MOC_LITERAL(45, 966, 24), // "deleteSceneButtonClicked"
QT_MOC_LITERAL(46, 991, 24), // "deleteQueryButtonClicked"
QT_MOC_LITERAL(47, 1016, 22), // "loadSceneButtonClicked"
QT_MOC_LITERAL(48, 1039, 22), // "loadQueryButtonClicked"
QT_MOC_LITERAL(49, 1062, 24), // "warehouseItemNameChanged"
QT_MOC_LITERAL(50, 1087, 16), // "QTreeWidgetItem*"
QT_MOC_LITERAL(51, 1104, 6), // "column"
QT_MOC_LITERAL(52, 1111, 22), // "loadStateButtonClicked"
QT_MOC_LITERAL(53, 1134, 27), // "saveStartStateButtonClicked"
QT_MOC_LITERAL(54, 1162, 26), // "saveGoalStateButtonClicked"
QT_MOC_LITERAL(55, 1189, 24), // "removeStateButtonClicked"
QT_MOC_LITERAL(56, 1214, 24), // "clearStatesButtonClicked"
QT_MOC_LITERAL(57, 1239, 28), // "setAsStartStateButtonClicked"
QT_MOC_LITERAL(58, 1268, 27), // "setAsGoalStateButtonClicked"
QT_MOC_LITERAL(59, 1296, 26), // "detectObjectsButtonClicked"
QT_MOC_LITERAL(60, 1323, 23), // "pickObjectButtonClicked"
QT_MOC_LITERAL(61, 1347, 24), // "placeObjectButtonClicked"
QT_MOC_LITERAL(62, 1372, 29), // "selectedDetectedObjectChanged"
QT_MOC_LITERAL(63, 1402, 21), // "detectedObjectChanged"
QT_MOC_LITERAL(64, 1424, 29), // "selectedSupportSurfaceChanged"
QT_MOC_LITERAL(65, 1454, 10) // "tabChanged"

    },
    "moveit_rviz_plugin::MotionPlanningFrame\0"
    "planningFinished\0\0databaseConnectButtonClicked\0"
    "publishSceneButtonClicked\0"
    "planningAlgorithmIndexChanged\0index\0"
    "resetDbButtonClicked\0approximateIKChanged\0"
    "state\0planButtonClicked\0executeButtonClicked\0"
    "planAndExecuteButtonClicked\0"
    "stopButtonClicked\0allowReplanningToggled\0"
    "checked\0allowLookingToggled\0"
    "allowExternalProgramCommunication\0"
    "enable\0pathConstraintsIndexChanged\0"
    "useStartStateButtonClicked\0"
    "useGoalStateButtonClicked\0"
    "onClearOctomapClicked\0importFileButtonClicked\0"
    "importUrlButtonClicked\0clearSceneButtonClicked\0"
    "sceneScaleChanged\0value\0sceneScaleStartChange\0"
    "sceneScaleEndChange\0removeObjectButtonClicked\0"
    "selectedCollisionObjectChanged\0"
    "objectPoseValueChanged\0collisionObjectChanged\0"
    "QListWidgetItem*\0item\0imProcessFeedback\0"
    "visualization_msgs::InteractiveMarkerFeedback&\0"
    "feedback\0copySelectedCollisionObject\0"
    "exportAsTextButtonClicked\0"
    "importFromTextButtonClicked\0"
    "saveSceneButtonClicked\0planningSceneItemClicked\0"
    "saveQueryButtonClicked\0deleteSceneButtonClicked\0"
    "deleteQueryButtonClicked\0"
    "loadSceneButtonClicked\0loadQueryButtonClicked\0"
    "warehouseItemNameChanged\0QTreeWidgetItem*\0"
    "column\0loadStateButtonClicked\0"
    "saveStartStateButtonClicked\0"
    "saveGoalStateButtonClicked\0"
    "removeStateButtonClicked\0"
    "clearStatesButtonClicked\0"
    "setAsStartStateButtonClicked\0"
    "setAsGoalStateButtonClicked\0"
    "detectObjectsButtonClicked\0"
    "pickObjectButtonClicked\0"
    "placeObjectButtonClicked\0"
    "selectedDetectedObjectChanged\0"
    "detectedObjectChanged\0"
    "selectedSupportSurfaceChanged\0tabChanged"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_moveit_rviz_plugin__MotionPlanningFrame[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      53,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  279,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       3,    0,  280,    2, 0x08 /* Private */,
       4,    0,  281,    2, 0x08 /* Private */,
       5,    1,  282,    2, 0x08 /* Private */,
       7,    0,  285,    2, 0x08 /* Private */,
       8,    1,  286,    2, 0x08 /* Private */,
      10,    0,  289,    2, 0x08 /* Private */,
      11,    0,  290,    2, 0x08 /* Private */,
      12,    0,  291,    2, 0x08 /* Private */,
      13,    0,  292,    2, 0x08 /* Private */,
      14,    1,  293,    2, 0x08 /* Private */,
      16,    1,  296,    2, 0x08 /* Private */,
      17,    1,  299,    2, 0x08 /* Private */,
      19,    1,  302,    2, 0x08 /* Private */,
      20,    0,  305,    2, 0x08 /* Private */,
      21,    0,  306,    2, 0x08 /* Private */,
      22,    0,  307,    2, 0x08 /* Private */,
      23,    0,  308,    2, 0x08 /* Private */,
      24,    0,  309,    2, 0x08 /* Private */,
      25,    0,  310,    2, 0x08 /* Private */,
      26,    1,  311,    2, 0x08 /* Private */,
      28,    0,  314,    2, 0x08 /* Private */,
      29,    0,  315,    2, 0x08 /* Private */,
      30,    0,  316,    2, 0x08 /* Private */,
      31,    0,  317,    2, 0x08 /* Private */,
      32,    1,  318,    2, 0x08 /* Private */,
      33,    1,  321,    2, 0x08 /* Private */,
      36,    1,  324,    2, 0x08 /* Private */,
      39,    0,  327,    2, 0x08 /* Private */,
      40,    0,  328,    2, 0x08 /* Private */,
      41,    0,  329,    2, 0x08 /* Private */,
      42,    0,  330,    2, 0x08 /* Private */,
      43,    0,  331,    2, 0x08 /* Private */,
      44,    0,  332,    2, 0x08 /* Private */,
      45,    0,  333,    2, 0x08 /* Private */,
      46,    0,  334,    2, 0x08 /* Private */,
      47,    0,  335,    2, 0x08 /* Private */,
      48,    0,  336,    2, 0x08 /* Private */,
      49,    2,  337,    2, 0x08 /* Private */,
      52,    0,  342,    2, 0x08 /* Private */,
      53,    0,  343,    2, 0x08 /* Private */,
      54,    0,  344,    2, 0x08 /* Private */,
      55,    0,  345,    2, 0x08 /* Private */,
      56,    0,  346,    2, 0x08 /* Private */,
      57,    0,  347,    2, 0x08 /* Private */,
      58,    0,  348,    2, 0x08 /* Private */,
      59,    0,  349,    2, 0x08 /* Private */,
      60,    0,  350,    2, 0x08 /* Private */,
      61,    0,  351,    2, 0x08 /* Private */,
      62,    0,  352,    2, 0x08 /* Private */,
      63,    1,  353,    2, 0x08 /* Private */,
      64,    0,  356,    2, 0x08 /* Private */,
      65,    1,  357,    2, 0x08 /* Private */,

 // signals: parameters
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    6,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    9,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,   15,
    QMetaType::Void, QMetaType::Bool,   15,
    QMetaType::Void, QMetaType::Bool,   18,
    QMetaType::Void, QMetaType::Int,    6,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   27,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Double,   27,
    QMetaType::Void, 0x80000000 | 34,   35,
    QMetaType::Void, 0x80000000 | 37,   38,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 50, QMetaType::Int,   35,   51,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 34,   35,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    6,

       0        // eod
};

void moveit_rviz_plugin::MotionPlanningFrame::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MotionPlanningFrame *_t = static_cast<MotionPlanningFrame *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->planningFinished(); break;
        case 1: _t->databaseConnectButtonClicked(); break;
        case 2: _t->publishSceneButtonClicked(); break;
        case 3: _t->planningAlgorithmIndexChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->resetDbButtonClicked(); break;
        case 5: _t->approximateIKChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->planButtonClicked(); break;
        case 7: _t->executeButtonClicked(); break;
        case 8: _t->planAndExecuteButtonClicked(); break;
        case 9: _t->stopButtonClicked(); break;
        case 10: _t->allowReplanningToggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 11: _t->allowLookingToggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 12: _t->allowExternalProgramCommunication((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 13: _t->pathConstraintsIndexChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 14: _t->useStartStateButtonClicked(); break;
        case 15: _t->useGoalStateButtonClicked(); break;
        case 16: _t->onClearOctomapClicked(); break;
        case 17: _t->importFileButtonClicked(); break;
        case 18: _t->importUrlButtonClicked(); break;
        case 19: _t->clearSceneButtonClicked(); break;
        case 20: _t->sceneScaleChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 21: _t->sceneScaleStartChange(); break;
        case 22: _t->sceneScaleEndChange(); break;
        case 23: _t->removeObjectButtonClicked(); break;
        case 24: _t->selectedCollisionObjectChanged(); break;
        case 25: _t->objectPoseValueChanged((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 26: _t->collisionObjectChanged((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 27: _t->imProcessFeedback((*reinterpret_cast< visualization_msgs::InteractiveMarkerFeedback(*)>(_a[1]))); break;
        case 28: _t->copySelectedCollisionObject(); break;
        case 29: _t->exportAsTextButtonClicked(); break;
        case 30: _t->importFromTextButtonClicked(); break;
        case 31: _t->saveSceneButtonClicked(); break;
        case 32: _t->planningSceneItemClicked(); break;
        case 33: _t->saveQueryButtonClicked(); break;
        case 34: _t->deleteSceneButtonClicked(); break;
        case 35: _t->deleteQueryButtonClicked(); break;
        case 36: _t->loadSceneButtonClicked(); break;
        case 37: _t->loadQueryButtonClicked(); break;
        case 38: _t->warehouseItemNameChanged((*reinterpret_cast< QTreeWidgetItem*(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 39: _t->loadStateButtonClicked(); break;
        case 40: _t->saveStartStateButtonClicked(); break;
        case 41: _t->saveGoalStateButtonClicked(); break;
        case 42: _t->removeStateButtonClicked(); break;
        case 43: _t->clearStatesButtonClicked(); break;
        case 44: _t->setAsStartStateButtonClicked(); break;
        case 45: _t->setAsGoalStateButtonClicked(); break;
        case 46: _t->detectObjectsButtonClicked(); break;
        case 47: _t->pickObjectButtonClicked(); break;
        case 48: _t->placeObjectButtonClicked(); break;
        case 49: _t->selectedDetectedObjectChanged(); break;
        case 50: _t->detectedObjectChanged((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 51: _t->selectedSupportSurfaceChanged(); break;
        case 52: _t->tabChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (MotionPlanningFrame::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MotionPlanningFrame::planningFinished)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject moveit_rviz_plugin::MotionPlanningFrame::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_moveit_rviz_plugin__MotionPlanningFrame.data,
      qt_meta_data_moveit_rviz_plugin__MotionPlanningFrame,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *moveit_rviz_plugin::MotionPlanningFrame::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *moveit_rviz_plugin::MotionPlanningFrame::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_moveit_rviz_plugin__MotionPlanningFrame.stringdata0))
        return static_cast<void*>(const_cast< MotionPlanningFrame*>(this));
    return QWidget::qt_metacast(_clname);
}

int moveit_rviz_plugin::MotionPlanningFrame::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 53)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 53;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 53)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 53;
    }
    return _id;
}

// SIGNAL 0
void moveit_rviz_plugin::MotionPlanningFrame::planningFinished()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
