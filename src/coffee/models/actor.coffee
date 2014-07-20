module.exports = do =>
  @user = null
  @get = =>
    @user
  @login = =>
    deferred = z.deferred()
    kik.getUser (user) =>
      if not user
        return deferred.reject 'Permission Denied'
      @user = user
      deferred.resolve(user)
    deferred.promise
  return this