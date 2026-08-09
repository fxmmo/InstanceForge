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

function serialize.meshpart(obj)
  local data = {
    Name = obj.Name,
    ClassName = obj.ClassName,
    Parent = obj.Parent,
    Anchored = obj.Anchored,
    DoubleSided = obj.DoubleSided,
    MeshContent = obj.MeshContent,
    MeshId = obj.MeshId,
    RenderFidelity = obj.RenderFidelity,
    TextureContent = obj.TextureContent,
    TextureId = obj.TextureId,
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

function serialize.folder(obj)
  local data = {
    Name = obj.Name,
    ClassName = obj.ClassName,
    Parent = obj.Parent,
    Children = {}
  }

  for _, child in ipairs(obj:GetChildren()) do 
    if child:IsA("BasePart") then 
      table.insert(data.Children, self.basepart(child))
    elseif child:IsA("Folder") then 
      table.insert(data.Children, self.folder(child))
    elseif child:IsA("Model") then 
      table.insert(data.Children, self.model(child)) 
    end
  end

  return data
end

function serialize.model(obj)
  local data = {
    Name = obj.Name,
    ClassName = obj.ClassName,
    Parent = obj.Parent,
    Children = {}
  }

  for _, child in ipairs(obj:GetChildren()) do 
    if child:IsA("BasePart") then 
      table.insert(data.Children, self.basepart(child))
    elseif child:IsA("Folder") then 
      table.insert(data.Children, self.folder(child))
    elseif child:IsA("Model") then 
      table.insert(data.Children, self.model(child))
    end
  end

  return data 
end

return serialize