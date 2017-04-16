using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;

namespace Chmoky.Presentation.Mappers
{
    public class ViewModelMappingProfile : Profile
    {
        public ViewModelMappingProfile()
        {
            CreateMap<DataAccess.GetStatistics_Result, Models.Top10Record>()
                .ForMember(dest => dest.Author, opt => opt.MapFrom(src => new Models.Author {
                    SkypeID = src.author,
                    SkypeNames = src.DispName.Replace(",", "<br />") }))
                .ForMember(dest => dest.FullName, opt => opt.MapFrom(src => string.Format("{0} {1}", src.FirstName, src.LastName)));
        }
    }
}