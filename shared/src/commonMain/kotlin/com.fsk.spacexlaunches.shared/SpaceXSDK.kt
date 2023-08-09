package com.fsk.spacexlaunches.shared

import com.fsk.spacexlaunches.shared.cache.Database
import com.fsk.spacexlaunches.shared.cache.DatabaseDriverFactory
import com.fsk.spacexlaunches.shared.entity.RocketLaunch
import com.fsk.spacexlaunches.shared.network.SpaceXApi

class SpaceXSDK (databaseDriverFactory: DatabaseDriverFactory) {
    private val database = Database(databaseDriverFactory)
    private val api = SpaceXApi()

    @Throws(Exception::class)
    suspend fun getLaunches(forceReload: Boolean): List<RocketLaunch> {
        val cachedLaunches = database.getAllLaunches()
        return if (cachedLaunches.isNotEmpty() && !forceReload) {
            cachedLaunches
//            cachedLaunches.reversed()
        } else {
            api.getAllLaunches().also {
                database.clearDatabase()
                database.createLaunches(it)
            }
        }
    }
}