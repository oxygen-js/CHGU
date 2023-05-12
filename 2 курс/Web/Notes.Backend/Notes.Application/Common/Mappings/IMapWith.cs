using AutoMapper;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Notes.Application.Common.Mappings
{
    public interface IMapWith<T>
    {
        void Mapping(Profile profile) =>
            profile.CreateMap(typeof(T), GetType());
    }
}