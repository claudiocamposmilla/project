class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.administrator?
      can :manage, :all
      can :modify_profile, User do |other_user|
        !other_user.administrator?
      end
    elsif user.supervisor?
      can :manage, :all
      can :modify_profile, User do |other_user|
        !other_user.administrator? && !other_user.supervisor?
      end
    end

    can :my_comments, User, id: user.id
    # Para administradores, supervisores y ejecutivos
    if user.administrator? || user.supervisor? || user.executive?
      can :my_replies, User # Permiso para acceder a my_replies para cualquier usuario
    end

    can :my_resolutions, User, id: user.id

    if user.normal? || user.executive?
      # Solo pueden leer las resoluciones que están asociadas a su ID en UserResolution
      can :read, Resolution do |resolution|
        UserResolution.exists?(user_id: user.id, resolution_id: resolution.id)
      end
    end

    if user.normal?
      # Pueden editar las resoluciones que están asociadas a su ID en UserResolution
      can :update, Resolution do |resolution|
        UserResolution.exists?(user_id: user.id, resolution_id: resolution.id)
      end
    end

  end
end
