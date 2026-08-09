local serialize = {}

function serialize.basepart(obj)
  local data = {
    Name = obj.Name,
    ClassName = obj.ClassName,
    Parent = obj.Parent,
    Anchored = obj.Anchored,
    CanCollide = obj.CanCollide,
    CanQuery = obj.CanQuery,
    CanTouch = obj.CanTouch,
    Transparency = obj.Transparency,
    Material = obj.Material,
    MaterialVariant = obj.MaterialVariant,
    CastShadow = obj.CastShadow
    Size = {
      obj.Size.X,
      obj.Size.Y,
      obj.Size.Z
    },
    Color = {
      obj.Color.R,
      obj.Color.G,
      obj.Color.B
    },
    CFrame = {
      obj.CFrame:GetComponents()
    }
  }
  
  return data 
end