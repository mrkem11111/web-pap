/**
 * PAP Server Engine ( https://github.com/viticm/web-pap )
 * $Id PlayerManager.h
 * @link https://github.com/viticm/web-pap/tree/master/server for the canonical source repository
 * @copyright Copyright (c) 2013-2013 viticm( viticm@126.com )
 * @license
 * @user viticm<viticm@126.com>
 * @date 2013-9-5 14:27:20
 * @uses the player manager
 */
#ifndef __PLAYERMANAGER_H__
#define __PLAYERMANAGER_H__

#include "Type.h"
#include "Player.h"
#include "Socket.h"
#include "IDTable.h"


//管理一群玩家功能的基本模块,一般为每个场景创建一个PlayerManager
//并且在一个独立的线程内执行
class PlayerManager
{
public :
    PlayerManager() ;
    ~PlayerManager() ;

    //清除当前模块内的数据信息
    VOID                CleanUp() ;

    //逻辑接口
    virtual BOOL        HeartBeat( UINT uTime = 0 ) ;

    //增加一个玩家
    BOOL                AddPlayer( Player* pPlayer ) ;

    BOOL                AddPlayer( Player* pPlayer, UINT MaxPlayer ) ;
    //删除一个玩家

    VOID                RemovePlayer( PlayerID_t pid ) ;

    PlayerID_t*         GetPlayers(){ return m_pPlayers ; } ;

    UINT                GetPlayerNumber(){ return m_nPlayers ; } ;
    BOOL                HasPlayer(){ return (BOOL)m_nPlayers ; } ;



    BOOL                AddPlayer( PlayerID_t pid ) ;        //未提供功能接口

protected :
    //
    PlayerID_t    m_pPlayers[ MAX_PLAYER ] ;
    UINT          m_nPlayers ;
};

#endif
